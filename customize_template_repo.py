#!/usr/bin/env python3
import os
import sys

def customize_template_repo(new_package_name):
    script_name = os.path.basename(__file__)
    for root, dirs, files in os.walk('.'):
        for file in files:
            if file == script_name:
                continue
            file_path = os.path.join(root, file)
            with open(file_path, 'r') as f:
                content = f.read()
            content = content.replace('tidy_python', new_package_name)
            with open(file_path, 'w') as f:
                f.write(content)
        for dir in dirs:
            if dir == 'tidy_python':
                os.rename(os.path.join(root, dir), os.path.join(root, new_package_name))

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: ./customize_template_repo.py <new_package_name>")
        sys.exit(1)
    new_package_name = sys.argv[1]
    customize_template_repo(new_package_name)
    print("Template repository customized successfully.")
