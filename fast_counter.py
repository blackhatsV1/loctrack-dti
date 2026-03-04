
def count_sql_stats():
    sql_path = 'employees_loc_full_db_dump.sql'
    with open(sql_path, 'r', encoding='latin1') as f:
        content = f.read()
    
    users_tag = "INSERT INTO `users` VALUES"
    start = content.find(users_tag)
    if start == -1:
        print("Users table not found")
        return
    
    end = content.find(";", start)
    data = content[start:end]
    
    total = data.count("),(") + 1
    admins = data.count(",1,")
    
    print(f"Total Users: {total}")
    print(f"Admins (found via ,1,): {admins}")
    print(f"Non-Admins: {total - admins}")

if __name__ == "__main__":
    count_sql_stats()
