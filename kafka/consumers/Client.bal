
import ballerina/io;
import ballerinax/kafka;
import ballerina/lang.'string;
import ballerina/log;
kafka:ConsumerConfiguration consumerConfiguration = {
    bootstrapServers: "localhost:9092",

    groupId: "group-id",
    offsetReset: "earliest",
    topics: ["test-kafka-topic"]

};
kafka:Consumer consumer = new (consumerConfiguration);
public function main() {
    var results = consumer->poll(1000);

    if (results is error) {
        log:printError("Error occurred while polling ", err = results);
    }
    kafka:ConsumerRecord[] records = <kafka:ConsumerRecord[]>results;
    foreach var kafkaRecord in records {
        byte[] messageContent = kafkaRecord.value;
        string|error message = 'string:fromBytes(messageContent);
        if (message is string) {
            io:println("Received Message: ", message);

        } else {
            log:printError("Error occurred while converting message data",
                err = message);
        }
    }
}