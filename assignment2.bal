import ballerina/http;
import ballerina/http;
import ballerina/log;
import ballerina/docker;

@docker:Expose{}
listener http:Listener eVoto = new(9090, {
    secureSocket:{
        keyStore:{
            path:"./votingKeystore",
            password:"assignent2"
        }
    }
});
@docker:Config {
}

// By default, Ballerina exposes an HTTP service via HTTP/1.1.
service voting on eVoto {

    // Resource functions are invoked with the HTTP caller and the incoming request as arguments.
    resource function sayHello(http:Caller caller, http:Request req) {
        // Send a response back to the caller.
        var result = caller->respond("Fuck Ballerina man");
        if (result is error) {
            log:printError("Error sending response", result);
        }
    }
}
