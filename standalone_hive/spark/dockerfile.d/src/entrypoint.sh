#!/bin/sh

/opt/spark/sbin/start-master.sh
/opt/spark/sbin/start-thriftserver.sh \
  --master spark://spark-master:7077
/opt/spark/sbin/start-history-server.sh
/opt/spark/sbin/start-worker.sh spark://spark-master:7077
mlflow server --host 0.0.0.0 --port 3000 & \
jupyter lab --allow-root --config $SPARK_HOME/jupyter_lab_config.py
