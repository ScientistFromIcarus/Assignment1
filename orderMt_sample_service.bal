import ballerina/grpc;
import ballerina/log;

listener grpc:Listener ep = new (9090);

map<musicOrder> musicOrders= {};

service orderMt on ep {

    resource function addOrder(grpc:Caller caller, musicOrder value) {
    
    string musicId = value.id;
    musicOrders[value.date] = <@untainted>value;

    string payload = "STATUS : MUSIC ADDED, Date: "+ value.id;
   
  

  error? result = caller->send(payload);
  result = caller ->complete();

    if (result is error){
        log:printError("Error from connector: "+result.reason().toString());
    }
    }
    
    resource function getOrder(grpc:Caller caller, string musicId) {
         string payload = "";

         error? result = ();

         if (musicOrders.hasKey(musicId)){
        var jsonValue = json.constructFrom(musicOrders[musicId]);
          
          if (jsonValue is error) {
              result = caller ->sendError(grpc:INTERNAL,<string>jsonValue.detail().message);
          } else {
json orderDetails=jsonValue;
payload = orderDetails.toString();
result = caller->send(payload);
result = caller->complete();


          } 
          
         } else {
             payload = "song canniot be retrieved";
             result = caller ->sendError(grpc:NOT_FOUND, payload);
         }

         if (result is error){
             log:printError("Error from connector: "+result.reason().toString());
         }

    }



    resource function updateOrder(grpc:Caller caller, musicOrder value) {
       




   
    string musicId = value.date;
    musicOrders[value.date] = <@untainted>value;

    string payload = "STATUS : MUSIC updatED, Date: "+ value.id;
   
  

  error? result = caller->send(payload);
  result = caller ->complete();

    if (result is error){
        log:printError("Error from connector: "+result.reason().toString());
    }    
    }


    resource function deleteOrder(grpc:Caller caller, string musicId) {
        

string payload = "";

         error? result = ();

            

         if (musicOrders.hasKey(musicId)){

             musicOrders[musicId]={id:"",date:"",artists:[{name:"none",member:"none"},{name:"none",member:"none"},{name:"none",member:"none"}],band:"",songs:[{title:"none",genre:"none",platform:"none"}]};

        var jsonValue = json.constructFrom(musicOrders[musicId]);
          
          if (jsonValue is error) {
              result = caller ->sendError(grpc:INTERNAL,<string>jsonValue.detail().message);
          } else {
json orderDetails=jsonValue;
payload = orderDetails.toString();
result = caller->send(payload);
result = caller->complete();


          } 
          
         } else {
             payload = "song could not be deleted";
             result = caller ->sendError(grpc:NOT_FOUND, payload);
         }

         if (result is error){
             log:printError("Error from connector: "+result.reason().toString());
         }






        
    }
}


public type persons record {
   string name;
   string member;

};

public type song record {
string title;
string genre;
string platform;
};

public type musicOrder record {|
    string id;
    string date;
    persons[] artists;
    string band;
    song[] songs;
    
|};



const string ROOT_DESCRIPTOR = "0A0E736F6E67734D67722E70726F746F120C677270635F736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22640A0A6D757369634F7264657212120A046461746518012001280952046461746512180A076172746973747318022001280952076172746973747312120A0462616E64180320012809520462616E6412140A05736F6E67731804200128095205736F6E677332A7020A076F726465724D7412420A086164644F7264657212182E677270635F736572766963652E6D757369634F726465721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512460A086765744F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512450A0B7570646174654F7264657212182E677270635F736572766963652E6D757369634F726465721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512490A0B64656C6574654F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "songsMgr.proto":"0A0E736F6E67734D67722E70726F746F120C677270635F736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22640A0A6D757369634F7264657212120A046461746518012001280952046461746512180A076172746973747318022001280952076172746973747312120A0462616E64180320012809520462616E6412140A05736F6E67731804200128095205736F6E677332A7020A076F726465724D7412420A086164644F7264657212182E677270635F736572766963652E6D757369634F726465721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512460A086765744F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512450A0B7570646174654F7264657212182E677270635F736572766963652E6D757369634F726465721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512490A0B64656C6574654F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"
        
    };
}

