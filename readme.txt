VS: $source venv/bin/activate
Terminal:
$sudo apt-get install python3 python3-pip
$sudo install pip3
$pip3 install flask
Terminal schließen
Testcases_report-Ordner öffnen >> Terminal des Ornders öfnnen und folgende commit schreiben:: 
$FLASK_APP=app.py
$flask run
Output>> adresse

Falls das Fehler"Address already in use" raus kommt, dann dies commit "$kill -9 $(ps -A | grep python | awk '{print $1}')" in Hauptterminal schreiben
