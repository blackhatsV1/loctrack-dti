
import xml.etree.ElementTree as ET
import re
import os

def analyze_excel(file_path):
    if not os.path.exists(file_path):
        print(f"Error: {file_path} not found.")
        return
        
    tree = ET.parse(file_path)
    root = tree.getroot()
    ns = {'ns': 'http://schemas.openxmlformats.org/spreadsheetml/2006/main'}
    
    offices = set()
    sheet_data = root.find('ns:sheetData', ns)
    
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
            if value:
                cell_data[col] = value.strip()

        if 'B' in cell_data:
            office = cell_data.get('J')
            if office:
                offices.add(office)
    
    print(f"Unique Offices in Excel: {len(offices)}")
    for o in sorted(list(offices)):
        print(f" - {o}")

if __name__ == "__main__":
    if not os.path.exists('temp_excel'):
        os.system('mkdir -p temp_excel && unzip -d temp_excel DTI6_Employees_Locs.xlsx')
    analyze_excel('temp_excel/xl/worksheets/sheet1.xml')
