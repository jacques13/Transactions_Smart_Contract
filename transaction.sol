pragma solidity >=0.4.22 <0.6.0;
contract Document {
    
    struct Transaction {
        uint id;
        address ourAddress;
        address addressPaid;
        uint amount;
        string document;
        string date;
        string description;
    }
    
    uint counter = 0;
    
    mapping (uint => Transaction) transactions;
    address[] public transactionAccts;
    
    function setTransaction(address _ourAddress, address _addressPaid, uint _amount,  string memory _document,string memory _date, string memory _description) public {
        
        counter = counter +1;
        Transaction storage transaction = transactions[counter];
        transaction.id = counter;
        transaction.ourAddress = _ourAddress;
        transaction.addressPaid =_addressPaid ;
        transaction.amount = _amount;
        transaction.document = _document;
        transaction.date = _date;
        transaction.description = _description;
        
        transactionAccts.push(_ourAddress) -1;
    }
    
    function getTransactions() view public returns(address[] memory) {
        return transactionAccts;
    }
    
    function getTransaction(uint _ID) view public returns (uint,address,address,uint, string memory, string memory, string memory) {
        return (transactions[_ID].id,transactions[_ID].ourAddress, transactions[_ID].addressPaid, transactions[_ID].amount, transactions[_ID].document, transactions[_ID].date, transactions[_ID].description);
    }
    
    function countTransactions() view public returns (uint) {
        return transactionAccts.length;
    }
    
}