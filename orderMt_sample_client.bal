 import ballerina/io;
import ballerina/grpc;
import ballerina/log;


public function main (string... args) {


string name="";
string band="";
string title="";
string genre="";
string platform="";
string input="";

    orderMtBlockingClient blockingEp = new("http://localhost:9090");

    string menu=menuSelect(blockingEp);
     
    io:println(menu);









}

function menuSelect(orderMtBlockingClient blockingEp) returns string{ 

string id ="";
string name="";
string band="";
string title="";
string genre="";
string platform="";
string input="";
string menuInv=menuSelect(blockingEp);




string menu="**********MENU*********"+
            "|\n                     |"+
            "|\n (1) Write new record|"+
            "|\n                     |"+
            "|\n (2) Retrieve record |"+  
            "|\n                     |"+
            "|\n (3) Update record   |"+
            "|\n                     |"+
            "|\n (4) Delete record   |"+
            "|\n                     |"+
            "|\n*********************|";



input=io:readln("select a NUMBER: ");



musicOrder value={ 
    id:id,
    date: "10/10/20",
    artists:[
    {
        name: name,
        member: "yes"
    },
    {
        name: name,
        member: "yes"
    },
    {
        name: name,
        member: "yes"
        }

    ],
    band: band,
    songs:[
    {
     title: title,
     genre: genre,
     platform: platform
    }]
};


if(input == "1"){
io:println("addorder");

id =io:readln("Enter id: ");
name = io:readln("Enter name of artist: ");
band = io:readln("Enter name of band: ");
title = io:readln("Enter songs title: ");
genre = io:readln("Enter genre: ");
platform = io:readln("Enter platform: ");

//the record



var addResponse = blockingEp->addOrder(value);

if(addResponse is error){
    log:printError("Error frommmmmmmmmm connector"+addResponse.reason().toString());
}
else{
string result;
grpc:Headers resHeaders;
[result,resHeaders] = addResponse;
log:printInfo("Response =" + result +"\n");

}



    io:println(menuInv);

}


else if(input=="2"){
    io:println("get");
var getResponse =blockingEp->getOrder(value.id);

if(getResponse is error){
    log:printError("Error from connector: "+getResponse.reason().toString());
} else{
    string result;
    grpc:Headers resHeaders;
    [result, resHeaders] = getResponse;
    log:printInfo("Response = "+result+"\n");
}


    io:println(menuInv);



}
else if(input =="3"){
    io:println("update");

    var updateOrder  = blockingEp->updateOrder(value);

if(updateOrder is error){
    log:printError("Error from connector: "+updateOrder.reason().toString());
} else{
    string result;
    grpc:Headers resHeaders;
    [result, resHeaders] = updateOrder;
    log:printInfo("Response = "+result+"\n");
}

    io:println(menuInv);
    

}else{
    io:println("delete");
     var deleteOrder  = blockingEp->deleteOrder(value.id);
if(deleteOrder is error){
    log:printError("Error frommmmmmmmmm connector"+deleteOrder.reason().toString());
}
else{
string result;
grpc:Headers resHeaders;
[result,resHeaders] = deleteOrder;
log:printInfo("Response =" + result +"\n");

}

    io:println(menuInv);
      
}






return menu;

}



