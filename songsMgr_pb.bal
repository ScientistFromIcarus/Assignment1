import ballerina/grpc;

map<musicOrder> musicOrders= {};
public type orderMtBlockingClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function addOrder(musicOrder req, grpc:Headers? headers = ()) returns ([string, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("grpc_service.orderMt/addOrder", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        return [result.toString(), resHeaders];
    }

    public remote function getOrder(string req, grpc:Headers? headers = ()) returns ([string, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("grpc_service.orderMt/getOrder", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        return [result.toString(), resHeaders];
    }

    public remote function updateOrder(musicOrder req, grpc:Headers? headers = ()) returns ([string, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("grpc_service.orderMt/updateOrder", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        return [result.toString(), resHeaders];
    }

    public remote function deleteOrder(string req, grpc:Headers? headers = ()) returns ([string, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("grpc_service.orderMt/deleteOrder", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        return [result.toString(), resHeaders];
    }

};

public type orderMtClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function addOrder(musicOrder req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("grpc_service.orderMt/addOrder", req, msgListener, headers);
    }

    public remote function getOrder(string req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("grpc_service.orderMt/getOrder", req, msgListener, headers);
    }

    public remote function updateOrder(musicOrder req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("grpc_service.orderMt/updateOrder", req, msgListener, headers);
    }

    public remote function deleteOrder(string req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("grpc_service.orderMt/deleteOrder", req, msgListener, headers);
    }

};

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
    persons[] artists ;
    string band ;
    song[] songs;
    
|};



const string ROOT_DESCRIPTOR = "0A0E736F6E67734D67722E70726F746F120C677270635F736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22640A0A6D757369634F7264657212120A046461746518012001280952046461746512180A076172746973747318022001280952076172746973747312120A0462616E64180320012809520462616E6412140A05736F6E67731804200128095205736F6E677332A7020A076F726465724D7412420A086164644F7264657212182E677270635F736572766963652E6D757369634F726465721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512460A086765744F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512450A0B7570646174654F7264657212182E677270635F736572766963652E6D757369634F726465721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512490A0B64656C6574654F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "songsMgr.proto":"0A0E736F6E67734D67722E70726F746F120C677270635F736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22640A0A6D757369634F7264657212120A046461746518012001280952046461746512180A076172746973747318022001280952076172746973747312120A0462616E64180320012809520462616E6412140A05736F6E67731804200128095205736F6E677332A7020A076F726465724D7412420A086164644F7264657212182E677270635F736572766963652E6D757369634F726465721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512460A086765744F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512450A0B7570646174654F7264657212182E677270635F736572766963652E6D757369634F726465721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512490A0B64656C6574654F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"
        
    };
}

