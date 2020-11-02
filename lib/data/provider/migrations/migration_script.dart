final migrationScripts = {
  1: _create_user_table,
  2: _create_wishlist_table,
  3: _create_portfolio_table,
  4: _create_transactions_table
};

const user_table = 'user';
const wishlist_table = "whishlist";
const portfolio_table = "portfolio";
const stocks_table = "stocks";

const transactions_table = "transcations";

final _create_user_table = '''CREATE TABLE "$user_table"(
  id INTEGER,
  full_name varchar(100),
  gender VARCHAR,
  mobile_number NUMERIC,
  country VARCHAR,
  address VARCHAR
)
''';

final _create_wishlist_table = ''' 
symbol VARCHAR,
company_name VARCHAR,
company_id VARCHAR,
alert INTEGER
''';

final _create_portfolio_table = '''CREATE TABLE "$portfolio_table"(
 portfolio_id INTEGER,
portfolio_name VARCHAR,
porfolio_type VARCHAR
)
''';

final _create_transactions_table = ''''
CREATE TABLE "$transactions_table" (
  portfolio_id INTEGER,
  company_id INTEGER,
  stock_buy_type VARCHAR,
  transcation_type VARCHAR
  no_of_units INTEGER,
  transaction_price NUMERIC,
  transaction_date VARCHAR,
  last_transaction_price   NUMERIC,
  last_closing_price NUMERIC,
  todays_change NUMERIC

)

''';

// transaction_type =buy.sell
// stock_buy_type= ipo/fpo/secondary
// portfolio_type =individual/insittutional

final _create_stock_table = ''''
CREATE TABLE "$wishlist_table"(
  company_id INTEGER,
  symbol VARCHAR,
  company_category VARCHAR,
  company_category_id INTEGER,
  ltp VARCHAR,
  change NUMERIC,
  change_percent DECIMAL
)
''';
