echo "NOT FOR USE \n This is a demo script that will error when executed"
exit 1


## NOTES
docker build -t mr .
docker run -it --entrypoint bash mr

