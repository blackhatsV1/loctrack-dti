
import xml.etree.ElementTree as ET
import re

def analyze_excel(file_path):
    print(f"Analyzing {file_path}...")
    tree = ET.parse(file_path)
    root = tree.getroot()
    ns = {'ns': 'http://schemas.openxmlformats.org/spreadsheetml/2006/main'}
    
    offices = set()
    sheet_data = root.find('ns:sheetData', ns)
    count = 0
    
    for row in sheet_data.findall('ns:row', ns):
        row_num = int(row.get('r'))
        if row_num == 1: continue

        cell_data = {}
        for cell in row.findall('ns:c', ns):
            col = re.sub(r'\d+', '', cell.get('r'))
            value = ""
            inline_str = cell.find('ns:is/ns:t', ns)
            if inline_str is not None:
                value = inline_str.text
            else:
                v = cell.find('ns:v', ns)
                if v is not None:
                    value = v.text
            cell_data[col] = value.strip() if value else ""

        if 'B' in cell_data and cell_data['B']:
            count += 1
            if 'J' in cell_data and cell_data['J']:
                offices.add(cell_data['J'])
    
    print(f"Total Employees in Excel: {count}")
    print(f"Unique Offices in Excel: {len(offices)}")
    return offices

def analyze_sql(file_path):
    print(f"Analyzing {file_path}...")
    
    admins = 0
    non_admins = 0
    offices = set()

    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    # Admin count
    print("Counting users...")
    user_blocks = re.findall(r"INSERT INTO `users` VALUES\s*(.*?);", content, re.DOTALL)
    for block in user_blocks:
        rows = re.findall(r"\(\d+,'[^']*','[^']*',.*?,.*?,([01]),.*?\)", block)
        for is_admin in rows:
            if is_admin == '1':
                admins += 1
            else:
                non_admins += 1
    
    print(f"Admins in SQL: {admins}")
    print(f"Non-Admins in SQL: {non_admins}")

    # Offices
    print("Counting offices...")
    loc_blocks = re.findall(r"INSERT INTO `employee_locations` VALUES\s*(.*?);", content, re.DOTALL)
    for block in loc_blocks:
        # Split block into individual rows manually
        i = 0
        while i < len(block):
            start = block.find('(', i)
            if start == -1: break
            end = -1
            in_quote = False
            for j in range(start + 1, len(block)):
                if block[j] == "'" and (j == 0 or block[j-1] != '\\'): in_quote = not in_quote
                elif block[j] == ')' and not in_quote:
                    end = j
                    break
            if end == -1: break
            row_str = block[start+1:end]
            i = end + 1
            
            # Simple comma split for office (field 8, index 7)
            parts = []
            curr = ""
            iq = False
            for c in row_str:
                if c == "'": iq = not iq
                elif c == "," and not iq:
                    parts.append(curr.strip())
                    curr = ""
                else: curr += c
            parts.append(curr.strip())
            
            if len(parts) >= 8:
                office = parts[7].strip("'")
                if office != 'NULL' and office:
                    offices.add(office)
    
    print(f"Unique Offices in SQL: {len(offices)}")
    return offices

if __name__ == "__main__":
    import os
    if not os.path.exists('temp_excel'):
        os.system('mkdir -p temp_excel && unzip -d temp_excel DTI6_Employees_Locs.xlsx')
    
    excel_offices = analyze_excel('temp_excel/xl/worksheets/sheet1.xml')
    sql_offices = analyze_sql('employees_loc_full_db_dump.sql')
    
    print("\nOffice Name Check:")
    if excel_offices == sql_offices:
        print("Office sets match exactly.")
    else:
        print(f"Excel only: {len(excel_offices - sql_offices)}")
        print(f"SQL only: {len(sql_offices - excel_offices)}")
