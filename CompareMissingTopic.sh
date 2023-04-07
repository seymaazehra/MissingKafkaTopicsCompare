#!/bin/bash

#read -p "Enter Kafka IP: "  kafkaIP
#read -p "Enter kafka-console-consumer.sh path: "  kafka_topics_path
#read -p "Enter kafka_text_file path: "  TextFile

kafkaIP=192.168.0.155
kafka_topics_path=./kafka-topics.sh
missing_count=0


for topic in $($kafka_topics_path --bootstrap-server $kafkaIP:9092 --list)
do
      let counter=counter+1
      
      if ! grep $topic ./missing_list.txt
	 then
      echo "$counter. Topic: '$topic' is missing"
	  let missing_count=missing_count+1
	  else
	  echo "$counter. Topic: '$topic' is exists"
	 fi

done 
echo "Total $missing_count topic missing"	  
  
     
 

