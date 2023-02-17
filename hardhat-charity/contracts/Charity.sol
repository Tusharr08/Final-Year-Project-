//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.17;


contract Genuine_Charity_DApp{
  struct CharityOrg{
  string OrgName;
  address  OrgAddress;
  string Desc;
}

struct Payment{
   string description;
   uint amount;
   address receiver;
   bool completed;


}

struct Product{
    string productId;
    string productName;
    uint price;
    address seller;
    bool ongoing;

       }

struct Beneficiary{
    string description;
    uint maxContr;
    address store;
    bool complete;
    uint approvalCount;
    mapping(address => bool) approvals;
    bool display;

}

struct Donator {

    string name;
    string message;
    uint projectID;
    uint value;
    // uint account_balance;
    address Address;

}

struct CoopStore{
  string StoreName;
  address StoreAddress;
  // uint account_balance;

}

// Beneficiary[] public CharityProjects;  //(should be a list of structs) Duplicate, needs to be merged with the Beneficiary Upload info struct
Donator[] public donators;  //stores data of all donators
uint cntBeneficiaries;
Beneficiary[] public beneficiaries;
// address public reciever;
uint public minContr;
CoopStore[] public CooperativeStores;
/* string[] public BeneficiaryInfo;  //(should be a list of structs) Duplicate, needs to be merged with the Beneficiary Upload info struct */

mapping(address => bool) approvers;
uint public approversCount;
mapping (string => Product) products;
Product[] public allProducts;
Payment[] public payments;

Product [] product;


  //CHARITY ORG METHODS
  CharityOrg public c;

  constructor() { //constructor
      c = CharityOrg("Genuine_Charity_Team",msg.sender,"Team of Genuine Charity App");
      product.push(Product("0","Computer",10,msg.sender,true));
      product.push(Product("1","Laptop",20,msg.sender,true));
      product.push(Product("2","Food",5,msg.sender,true));
      product.push(Product("3","Books",3,msg.sender,true));
      product.push(Product("4","Bag",1,msg.sender,true));
      CoopStore memory co = CoopStore("Genuine_Charity_Cooperative_Store",msg.sender);
      CooperativeStores.push(co);
    }

  function Post_Project(uint id) public {
    // CharityProjects.push(beneficiaries[id]);
    if (msg.sender == c.OrgAddress)
    {
    beneficiaries[id].display = true;
    }
  }

  function Send_Money_Beneficiary(uint id) public payable {
    if (msg.sender == c.OrgAddress)
    {
      // pay money to benficiary


      // Project goal to be implemented
      //payments[id].receiver.transfer(payments[id].amount);
      payable(payments[id].receiver).transfer(payments[id].amount);
      payments[id].completed = true;
    }
  }

  function Remove_Project(uint id) public{ //remove project after the required money is collected
    beneficiaries[id].display = false;
    // CharityProjects[id] = CharityProjects[CharityProjects.length - 1];
    // delete CharityProjects[CharityProjects.length - 1];
    // CharityProjects.length--;
    }

    // DONATOR METHODS

    function create_donator(string memory _name ,string memory _message) public returns (uint) {
        //constructor
        Donator memory d = Donator({ name:_name, message:_message, projectID:1, value:10, Address:msg.sender });
        donators.push(d);
        return donators.length-1;
    }

    function make_donations(uint id) public payable
    {
      payable(c.OrgAddress).transfer(donators[id].value);
    }


    function selectCharityProject (uint id,uint _projectId,uint value) public{
      if(_projectId !=999)
      donators[id].projectID = _projectId;
      if(value > 0)
      donators[id].value = value;

    }

    // BENEFICIARY METHODS
    /* modifier restrict({
        require(msg.sender == reciever);
        _;
    }) */
    function donateVote() public payable{
        require(msg.value > minContr);

    approvers[msg.sender] = true;
    approversCount++;

    }

    function createRequest(string memory _description, uint _maxContr, address _store) public {
        Beneficiary storage newRequest = beneficiaries[cntBeneficiaries++];
        newRequest.description= _description;
        newRequest.maxContr= _maxContr;
        newRequest.store= _store;
        newRequest.complete=false;
        newRequest.approvalCount=0;
        newRequest.display=false;

        
    }


    function approveRequest(uint index) public{
        Beneficiary storage request = beneficiaries[index];

        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);

        request.approvals[msg.sender] = true;
        request.approvalCount++;
    }

    function transferToStore(uint index) public  {
        Beneficiary storage request = beneficiaries[index];
        require(request.approvalCount > approversCount/2);
        payable(request.store).transfer(request.maxContr);
        request.complete = true;
    }

    function RequestMoneyAfterCompletion(uint index) public {
      Beneficiary storage request = beneficiaries[index];
        require(request.approvalCount > approversCount/2);
        Payment memory p = Payment(request.description,request.maxContr,msg.sender,true);
        payments.push(p);
    }

    // function addProduct(string memory _productId, string memory _productName, uint _price) public {
    //    require(!products[_productId].ongoing);


    //     Product memory product1 = Product(_productId, _productName,_price, msg.sender, true);
    //     products[_productId].productId= _productId;
    //     products[_productId].productName= _productName;
    //     products[_productId].price= _price;
    //     products[_productId].seller= msg.sender;
    //     products[_productId].ongoing = true;
    //     allProducts.push(product1);
    //   }






    // COOPERATIVE STORE METHODS
    /* CoopStore Cs; */
    /* modifier onlyBeneficiary() {
   require(msg.sender ==  Beneficiary, "Only Beneficiary!");
        _;
      } */




    // function add_product(string memory id,string memory product_name,uint price) public{
    //   product.push(Product(id,product_name,price,msg.sender,true));
    // }


    // function receive_money(uint id) public payable {
    //     require(msg.value >=0.0001 ether);
    //     // CooperativeStores[id].account_balance+=msg.value;
    //     //return products bought by beneficiary.
    // }
    // function update_account() public {
    //     return account_balance;
    // }
  }
