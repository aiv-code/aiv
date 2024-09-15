#!/bin/bash

# Set the variables
aiv_port=8080
aiv_db_url="jdbc:postgresql://localhost:5432?currentSchema=aiv"
aiv_db_user="aiv"
aiv_db_password="aivpassword"
security_db_url="jdbc:postgresql://localhost:5432?currentSchema=security"
security_db_user="security"
security_db_password="securitypassword"
jira_db_url="jdbc:postgresql://localhost:5432?currentSchema=jira"
jira_db_user="jira"
jira_db_password="jirapassword"
atlassian_url="https://app.atlassian.net"
addon_base_url="http://localhost:8080/aiv"
aiv_base="$(pwd)"

# Set file paths
original_file="$aiv_base/config/application.template"
aiv_logback_file="$aiv_base/config/logback.template"
jira_logback_file="$aiv_base/config/logback_jira.template"

new_file="$aiv_base/config/application.yml"
aiv_logback_new_file="$aiv_base/config/logback.xml"
jira_logback_new_file="$aiv_base/config/logback_jira.xml"

# Convert backslashes to forward slashes in aiv_base (for Unix-style paths)
aiv_base="${aiv_base//\\//}"

# Create a temporary file for processing
temp_file="$aiv_base/config/temp.yml"

# Replace placeholders in the application template and write to new_file
while IFS= read -r line; do
    line="${line//\$\{aiv_port\}/$aiv_port}"
    line="${line//\$\{aiv_db_url\}/$aiv_db_url}"
    line="${line//\$\{aiv_db_user\}/$aiv_db_user}"
    line="${line//\$\{aiv_db_password\}/$aiv_db_password}"
    line="${line//\$\{security_db_url\}/$security_db_url}"
    line="${line//\$\{security_db_user\}/$security_db_user}"
    line="${line//\$\{security_db_password\}/$security_db_password}"
    line="${line//\$\{jira_db_url\}/$jira_db_url}"
    line="${line//\$\{jira_db_user\}/$jira_db_user}"
    line="${line//\$\{jira_db_password\}/$jira_db_password}"
    line="${line//\$\{aiv_base\}/$aiv_base}"
    line="${line//\$\{atlassian_url\}/$atlassian_url}"
    echo "$line"
done < "$original_file" > "$temp_file"

# Move the temporary file to new_file
mv "$temp_file" "$new_file"

# Replace placeholders in aiv_logback_file and write to aiv_logback_new_file
while IFS= read -r line; do
    line="${line//\$\{aiv_base\}/$aiv_base}"
    echo "$line"
done < "$aiv_logback_file" > "$temp_file"

mv "$temp_file" "$aiv_logback_new_file"

# Replace placeholders in jira_logback_file and write to jira_logback_new_file
while IFS= read -r line; do
    line="${line//\$\{aiv_base\}/$aiv_base}"
    echo "$line"
done < "$jira_logback_file" > "$temp_file"

mv "$temp_file" "$jira_logback_new_file"

echo "Variables replaced and written to $new_file, $aiv_logback_new_file, and $jira_logback_new_file"