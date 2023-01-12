How to deploy a aked image via Packer

Requirements :
- initial-ami.json
- variable-ami.json


Command to execute:
packer build -var-file=variable.json initial-ami json
