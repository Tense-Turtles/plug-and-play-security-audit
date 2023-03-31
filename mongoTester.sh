connection_string="mongodb+srv://shellr:gZ8yt1D1zg3ro9qe@cluster0.zfbvsyl.mongodb.net/Kavach?retryWrites=true&w=majority"

echo "Inside tester"
cd lynis-report-converter
file_path="json_report.json"

collection="auditReports"

mongoimport --uri "$connection_string" --collection "$collection" --file "$file_path"

file_path="report.pdf"

collection="auditReports"

mongofiles --uri "$connection_string" put "$file_path"
