final migrationScripts = {
  1: _create_user_table,
  2: _create_wishlist_table,
  3: _create_portfolio_table,
  4: _create_transactions_table,
  5: _create_porfolio_stocks,
  6: _create_stock_table
};

const user_table = 'user';
const wishlist_table = "whishlist";
const portfolio_table = "portfolio";
const stocks_table = "stocks";

const portfolio_stocks = "portfolio_stocks";

const transactions_table = "transcations";

final _create_user_table = '''CREATE TABLE "$user_table"(
  id INTEGER,
  full_name varchar(100),
  gender VARCHAR,
  mobileNumber NUMERIC,
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
portfolioId INTEGER,
portfolioName VARCHAR,
portfolioType VARCHAR
)
''';

final _create_transactions_table = '''
CREATE TABLE "$transactions_table" (
  portfolioId INTEGER,
  comapnyId INTEGER,
  stockBuyType VARCHAR,
  transactionType VARCHAR
  noOfUnits INTEGER,
  transactionPrice NUMERIC,
  transactionDate VARCHAR,
  lastTransactionPrice   NUMERIC,
  lastClosingPrice NUMERIC,
  todaysChange NUMERIC
)
''';

// transaction_type =buy.sell
// stock_buy_type= ipo/fpo/secondary
// portfolio_type =individual/insittutional

final _create_stock_table = '''
CREATE TABLE "$stocks_table"(
  companyId INTEGER,
  name VARCHAR,
  symbol VARCHAR,
  sectorName VARCHAR,
  sectorId INTEGER,
  lastUpdatedPrice VARCHAR,
  change NUMERIC,

  changePercent DECIMAL

)
''';

final _create_porfolio_stocks = '''
CREATE TABLE "$portfolio_stocks"(
  companyId INTEGER,
  symbol VARCHAR,
  sectorName VARCHAR,
  sectorId INTEGER,
  lastTradedPrice VARCHAR,
  buyingPrice varchar,
  buyingUnits varchar,
  buyingDate varchar
)
''';
