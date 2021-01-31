//PRODUCER
import ballerina/log;
import ballerina/http;
import ballerina/kafka;
import wso2/gateway;

kafka:ProducerConfig producerConfigs ={
    bootstrapServers: "localhost:9092, localhost:9092" //producer localhost,
    clientId: "voters",
    acks: "all",
    retryCount: 3
}

kafka:Producer kafkaProducer = new (producerConfigs);

public type APIGatewayListener object {
   public {
       EndpointConfiguration config;
       http:Listener httpListener;
   }

   new () {
       httpListener = new;
   }

   public function register(typedesc serviceType);

   public function start();

   public function deadline() returns (http:Connection);

   public function fraudelets();
};


type Voter record {
    string name;
    string gender;
    int voterId;
};
type Candidate record {
    string name;
    string gender;
    int candidateId;
};

@docker:Config{
    name: "testVoTo"
    tag: "V4.3"
}
@docker:Expose{}

@kubernetes:Ingress {
   hostname: "",
   name: "",
   path: "/"
}

@kubernetes:Service {
   serviceType: "NodePort",
   name: ""
}

@kubernetes:Deployment {
   image: "",
   baseImage: "",
   name: "",
   copyFiles: [{ target: "",
               source: <path_to_JDBC_jar> }]
}

@http:ServiceConfig{
    basePath: "/addNew"
}
service addNew on httpListener {
    @http:ResourceConfig{
        path: "/voters/{name}"
    }

    resource function addVoters(http:Caller outboundEP, http:Request request){
        http:Response res = new;

        var payloadJson = request.getJsonPayload();

        if (payloadJson is json) {
            Voter|error votersData = Voter.constructFrom(payloadJson);

            if (voterData is Voter) {
                // Validate JSON payload
                if (votersData.voterId == 0 || votersData.name == "" ||votersData.gender == "") {
                        response.statusCode = 400;
                        response.setPayload("Error: JSON payload should contain " +
                        "{voterId:<int>,name:<string>, gender:<string>,");
                } else {
                    // Invoke addVoters function to save data in the MySQL database
                    json ret = insertData(voterData.voterId, voterData.name, voterData.gender);
                    response.setPayload("data": {
    "Voters": [
      {
        "id: 1",
        "name": "VMartin Ubuntu",
        "gender: male"
      },
      {
        "id: 2",
        "name": "Carlos Naftal",
        "gender: female"
      },
      {
        "id: 3",
        "name": "Remaider Simon",
        "gender: male"
      }
    ]
    };
);
               response.setPayload(ret);
                }
            } else {
                // Send an error response in case of a conversion failure
                response.statusCode = 400;
                response.setPayload("Error: Please send the JSON payload in the correct format");
            }
        } else {
            response.statusCode = 500;
            response.setPayload("Error: An internal error occurred");
        }

    }

}
service viewVoter on httpListener {
    @http:ResourceConfig{
        methods: ["GET"],
        path: "/voters/{voterId}"
    }


    resource function viewVoters(http:Caller outboundEP, http:Request request, voterData){
        http:Response res = new;


var voterID = ints:fromString(candidateId);
        if (voterID is int) {
            var result = rch.readJson(voterId);

            json viewCurrentInfo = {"id: ",
        "name": " ",
        "gender:  "


if(voterData is fraudelets){
    listener http:Listener secureHelloWorldEp = new(9092), {
    auth: {
        authHandlers: [basicAuthHandler]
    },
    secureSocket: {
        keyStore: {
            path: config:getAsString("Voter has voted more than once!") + "/security/rejectsstore",
            password: "ballerina"
        }
    }
});

}

            byte[] message = viewCurrentInfo.toString().toBytes();
            var sendResult = kafkaProducer->send(message, string '${members}-" "', partition=0 //topic in kafka);
            // Send the response back to the client with the employee data
            response.setPayload(employeeData);
        }
        else if(sendResult is error){
            response.statusCode = 500; //What is a status code?
            response.setJsonPayload({"The ID entered is not registered in the system!"});
            var responseResult = outboundEP->respond(response);
        }
        //Send a success
        response.setJsonPayload({"Succesfull!"});
        var responseResult = outboundEP->respond(response);
    }
    service candidates on httpListener {
        @http:ResourceConfig{
            path: "/candidates/{name}"
        }

        resource function candidates(http:Caller outboundEP, http:Request request){
            http:Response res = new;

            var payloadJson = request.getJsonPayload();

            if (payloadJson is json) {
                Candidate|error candidateData = Candidate.constructFrom(payloadJson);

                if (candidateData is candidate) {
                    // Validate JSON payload
                    if (candidateData.name == "") {
                            response.statusCode = 500;
                            response.setPayload("Error: JSON payload should contain " +
                            "{name:<string>");
                    } else {
                        // Invoke addVoters function to save data in the MySQL database
                        json ret = viewData(candidateData.name);
                        response.setPayload("candidates": [
          {
            "name: George Paul",
            "name: Sikeba Johnson",
            "name: Sophie Maharero",
            "name: Ross De Almeida",
            "category": CANDIDATE
          },

    );

                        response.setPayload(ret);
                    }
                }
            }

        }

    }


}