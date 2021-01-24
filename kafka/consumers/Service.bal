import ballerinax/kafka;
import ballerina/lang.'string;
import ballerina/log;
kafka:ConsumerConfiguration consumerConfigs = {
    bootstrapServers: "localhost:9092",

    groupId: "group-id",
    topics: ["test-kafka-topic"],

    pollingIntervalInMillis: 1000,
    keyDeserializerType: kafka:DES_BYTE_ARRAY,
    valueDeserializerType: kafka:DES_BYTE_ARRAY,
    autoCommit: false
};

listener kafka:Listener kafkaListener = new (consumerConfigs);
service kafka:Service on kafkaListener {
    remote function onMessage(kafka:Caller caller,
                                kafka:ConsumerRecord[] records) {
        foreach var kafkaRecord in records {
            processKafkaRecord(kafkaRecord);
        }

        var commitResult = caller->commit();

        if (commitResult is error) {
            log:printError("Error occurred while committing the " +
                "offsets for the consumer ", err = commitResult);
        }
    }
}
function processKafkaRecord(kafka:ConsumerRecord kafkaRecord) {
    byte[] value = kafkaRecord.value;
    string|error messageContent = 'string:fromBytes(value);
    if (messageContent is string) {
        log:print("Value: " + messageContent);
    } else {
        log:printError("Invalid value type received");
    }
}