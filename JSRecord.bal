import ballerina/io;

type Artist record {
    string name;
    boolean member=true;

};
type Band record {
    string bname;
    
};
type songs record {
    string title;
    string genre;
    string platform;
    
};

public function public function main() {
    Artist Music=[{
        name:"Winston Marshall",
        member:true
    },
    {name:"Ben Lovett",
    member:true},
    {name:"Baaba Maal",
    member:false}
    ]
    bname:"Mumford & Sons",
    songs:{
        title:"There will be time",
        genre:"folk rock",
        platform:"Deezer"
    }
};
json|error j = json.constructFrom(Music);
    if (j is json) {
        io:println(j.toJsonString());
        io:println(j.member.song);
    }