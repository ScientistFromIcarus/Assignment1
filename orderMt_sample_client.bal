import ballerina/io;
import ballerina/grpc;


public function main (string... args) {

    orderMtBlockingClient blockingEp = new("http://localhost:9090");

io:println("**********MENU*********");
io:println("|                     |");
io:println("| (1) Write new record|");
io:println("|                     |");
io:println("| (2) Retrieve record |");
io:println("|                     |");
io:println("| (3) Update record   |");
io:println("|                     |");
io:println("| (4) Delete record   |");
io:println("|                     |");
io:println("|*********************|");

// the record
musicOrder value={ date: "10/10/20",
    artists:[
    {
        name: "Winston Marshall",
        member: "yes"
    },
    {
        name: "Ben Lovett",
        member: "yes"
    },
    {
        name: "Baaba Maal",
        member: "yes"
        }

    ],
    band: "Mumford & Sons",
    songs:[
    {
     title: "There will be time",
     genre: "folk rock",
     platform: "deezer"
    }]
};

string input=io:readln()

if  (input == "1"){

var addResponse = blockingEp->addOrder(value);

} else {

    
}





}




