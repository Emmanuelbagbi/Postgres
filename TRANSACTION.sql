--TRANSACTION

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(50),
    Balance DECIMAL(10, 2)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(20), -- 'Deposit', 'Withdrawal', or 'Transfer'
    Amount DECIMAL(10, 2),
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Accounts (AccountID, AccountHolder, Balance) VALUES
(1, 'Alice', 5000.00),
(2, 'Bob', 3000.00),
(3, 'Charlie', 7000.00),
(4, 'David', 1500.00),
(5, 'Eve', 6000.00);

INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount) VALUES
(1, 1, 'Deposit', 1000.00),
(2, 1, 'Withdrawal', 500.00),
(3, 2, 'Deposit', 1500.00),
(4, 2, 'Withdrawal', 200.00),
(5, 3, 'Transfer', 1000.00),
(6, 3, 'Deposit', 2000.00),
(7, 4, 'Deposit', 500.00),
(8, 4, 'Withdrawal', 100.00),
(9, 5, 'Transfer', 1500.00),
(10, 5, 'Deposit', 2000.00),
(11, 1, 'Transfer', 1000.00),
(12, 2, 'Deposit', 700.00),
(13, 3, 'Withdrawal', 300.00),
(14, 4, 'Transfer', 400.00),
(15, 5, 'Deposit', 250.00);



--TRANSFER FUND FROM ONE ACCOUNT TO ANOTHER WITH A TRANSACTION
--TO TRANSFER FROM ALICE'S ACCOUNT 
--(ACCOUNT ID = 1) TO BOB'S ACCOUNT
--(ACCOUNT ID = 2) WE HAVE TO ENSURE THAT BOTH DEBT AND CREDIT ARE 
-- JOIN TOGETHER.

BEGIN;

update Accounts SET Balance = Balance = 500
where accountID = 1;

UPDATE accounts set Balance = Balance + 500
where accountID = 2;

insert into Transactions (TransactionID, AccountID, TransactionType, Amount)
values(16,1, 'Transfer' ,500.00);

insert into Transactions (TransactionID, AccountID, TransactionType, Amount)
values(17,2, 'Deposit' ,500.00);

COMMIT;


-- Question: Roll back a failed withdrawal if the balance is insufficient

DO $$	
BEGIN
	UPDATE Accounts 
	SET Balance = Balance - 1000
	WHERE AccountID = 3 AND Balance >= 1000;

	IF NOT FOUND THEN
		RAISE NOTICE 'Transaction rolled back: Insufficient Funds';
		ROLLBACK;
	ELSE
		INSERT INTO Transactions (TransactionID, AccountID, TransactionType, Amount)
		VALUES(18,3, 'Withdrawal' ,1000.00);

		COMMIT;
		RAISE NOTICE 'Transaction Successful: Withdrawal Processed';
	END IF;
END $$;


--ROLL BACK A FAIL WITHDRAWAL IF THE BALANCE IS INSUFFICIENT


Select * from accounts