-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.41 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping data for table recontool.breakactions: ~3 rows (approximately)
DELETE FROM `breakactions`;
/*!40000 ALTER TABLE `breakactions` DISABLE KEYS */;
INSERT INTO `breakactions` (`id`, `name`, `action1`, `action2`) VALUES
	(1, 'Status Mismatch', 'ActivateFO', 'InactivateRD'),
	(2, 'Singleton', 'IntimateFO', 'IntimateRd'),
	(3, 'AttributeMismatch', 'UpdateFO', 'UpdateMO');
/*!40000 ALTER TABLE `breakactions` ENABLE KEYS */;

-- Dumping data for table recontool.filerowdata: ~3 rows (approximately)
DELETE FROM `filerowdata`;
/*!40000 ALTER TABLE `filerowdata` DISABLE KEYS */;
INSERT INTO `filerowdata` (`id`, `reconfiles_id`, `jsonrowdata`, `breakactions_id`, `actiontaken`, `comment`, `insertdate`) VALUES
	(1, 1, '[{"side":"MO","buysell":"Buy","tradeid":"12345","counterpartyid":"Barclays","counterpartyname":"Barclays","focode":"VIP","status":"Active","category":"Status Mismatch","subcategory":"Active in MO Inactive in FO","comment":"Trade : 12345 has been successfully updated","actiontaken":"ActivateFO"}]', 1, 'ActivateFO', 'Trade : 12345 has been successfully updated', '2018-10-07'),
	(2, 1, '[{"side":"FO","buysell":"Sell","tradeid":"76525","counterpartyid":"Bank of America","counterpartyname":"Bank of America","focode":"DIP","status":"Inactive","attribute":null,"category":"Singleton","subcategory":"Singleton in FO","value":null}]', 2, NULL, NULL, '2018-10-07'),
	(3, 1, '[{"side":"FO","buysell":"Sell","tradeid":"76545","counterpartyid":"Bank of America","counterpartyname":"Bank of America","focode":"DIP","status":"Active","attribute":"Amount","category":"Attribute Mismatch","subcategory":"Ref Data v/s FO","value":"500"}]', 3, NULL, NULL, '2018-10-07'),
	(4, 1, '[{"side":"MO","buysell":"Buy","tradeid":"10001","counterpartyid":"Barclays","counterpartyname":"Barclays","focode":"VIP","status":"Active","attribute":null,"category":"Status Mismatch","subcategory":"Active in MO Inactive in FO","value":null}]', NULL, NULL, NULL, '2018-10-23'),
	(5, 1, '[{"side":"FO","buysell":"Sell","tradeid":"10002","counterpartyid":"Bank of America","counterpartyname":"Bank of America","focode":"DIP","status":"Inactive","attribute":null,"category":"Singleton","subcategory":"Singleton in FO","value":null}]', NULL, NULL, NULL, '2018-10-23'),
	(6, 1, '[{"side":"FO","buysell":"Sell","tradeid":"10002","counterpartyid":"Bank of America","counterpartyname":"Bank of America","focode":"DIP","status":"Active","attribute":"Amount","category":"Attribute Mismatch","subcategory":"Ref Data v/s FO","value":"5000"}]', NULL, NULL, NULL, '2018-10-23'),
	(7, 1, '[{"side":"MO","buysell":"Buy","tradeid":"20001","counterpartyid":"Barclays","counterpartyname":"Barclays","focode":"VIP","status":"Active","attribute":null,"category":"Status Mismatch","subcategory":"Active in MO Inactive in FO","value":null}]', NULL, NULL, NULL, '2018-10-23');
/*!40000 ALTER TABLE `filerowdata` ENABLE KEYS */;

-- Dumping data for table recontool.fomosystems: ~4 rows (approximately)
DELETE FROM `fomosystems`;
/*!40000 ALTER TABLE `fomosystems` DISABLE KEYS */;
INSERT INTO `fomosystems` (`id`, `tradeid`, `counterparty`, `currency`, `amount`, `buyorsell`, `tradedate`, `fees`, `quantity`, `exchange`, `price`, `rate`, `status`, `settlementdate`, `systemname`, `mtmvalue`) VALUES
	(1, '12345', 'JPMorgon', 'USD', '5422251', 'buy', '04/07/1098', '555', '200', 'XYZ', '51', '96', 'Active', '21/12/2018', 'FO', NULL),
	(2, '1000', 'JPMorgon', 'USD', '2223', 'buy', '20/08/2018', '555', NULL, 'XYZ', '51', NULL, 'Inactive', '21/12/2018', 'MO', '2323'),
	(3, '1001', 'Nomura', 'USD', '542225', 'buy', '20/08/2018', '555', '200', 'XYZ', '51', '96', NULL, '21/12/2018', 'FO', NULL),
	(4, '1001', 'Nomura', 'USD', '542225', 'buy', '20/08/2018', '555', '200', 'XYZ', '51', '96', NULL, '21/12/2018', 'MO', NULL);
/*!40000 ALTER TABLE `fomosystems` ENABLE KEYS */;

-- Dumping data for table recontool.reconfiles: ~1 rows (approximately)
DELETE FROM `reconfiles`;
/*!40000 ALTER TABLE `reconfiles` DISABLE KEYS */;
INSERT INTO `reconfiles` (`id`, `name`, `description`, `runschedule`, `information`) VALUES
	(1, 'IntelliMatchReport-30-9-18', 'Descripton of Report', 'Ran on 29-9-2018', 'Informatio of this Report');
/*!40000 ALTER TABLE `reconfiles` ENABLE KEYS */;

-- Dumping data for table recontool.reconusers: ~4 rows (approximately)
DELETE FROM `reconusers`;
/*!40000 ALTER TABLE `reconusers` DISABLE KEYS */;
INSERT INTO `reconusers` (`id`, `username`, `password`, `role`, `application`) VALUES
	(1, 'mithun', 'mithun', 'fomo', 'RR'),
	(2, 'krishna', 'krishna', 'fomo', 'RR'),
	(3, 'shashi', 'shashi', 'fo', 'RR'),
	(4, 'shashank', 'shashank', 'mo', 'RR');
/*!40000 ALTER TABLE `reconusers` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
