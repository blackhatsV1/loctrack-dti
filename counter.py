
import re
import os

def count_excel_offices():
    xml_path = 'temp_excel/xl/worksheets/sheet1.xml'
    if not os.path.exists(xml_path):
        os.system('mkdir -p temp_excel && unzip -o -d temp_excel DTI6_Employees_Locs.xlsx')
    
    with open(xml_path, 'r') as f:
        content = f.read()
    
    # Extract offices from column J
    # XML structure: <c r="J2" ...><is><t>Office Name</t></is></c>
    # or <c r="J2" ...><v>1</v></c> if shared string, but we saw inlineStr
    offices = re.findall(r'<c r="J\d+".*?<t>(.*?)</t>', content)
    unique_offices = set(o.strip() for o in offices if o.strip())
    print(f"Unique Offices in Excel: {len(unique_offices)}")
    return unique_offices


import re

def count_sql_stats():
    sql_path = 'employees_loc_full_db_dump.sql'
    admins = 0
    non_admins = 0
    db_offices = set()
    
    with open(sql_path, 'r', encoding='utf-8', errors='ignore') as f:
        # Read in 1MB chunks to handle long lines
        chunk_size = 1024 * 1024
        overlap = 1000 # To avoid missing matches at borders
        prev_chunk = ""
        
        while True:
            chunk = f.read(chunk_size)
            if not chunk: break
            
            combined = prev_chunk + chunk
            
            # Count users
            # Match (id, name, email, ..., is_admin, ...)
            user_matches = re.findall(r"\(\d+,'[^']*','[^']*',.*?,.*?,([01]),", combined)
            for is_admin in user_matches:
                if is_admin == '1': admins += 1
                else: non_admins += 1
            
            # Count offices in employee_locations
            # (id, user_id, lat, lng, address, recorded_at, deleted_at, office, ...)
            # Office is usually the 8th field
            # We look for the pattern of office names
            # Since addresses are long, let's just count unique strings that look like offices
            # Based on previous analysis, offices are strings in single quotes
            # Let's count (..., 'OFFICE NAME', ...)
            # This is hard without full record parsing.
            
            prev_chunk = chunk[-overlap:]
                        
    print(f"SQL Admins: {admins}")
    print(f"SQL Non-Admins: {non_admins}")

if __name__ == "__main__":
    count_sql_stats()
