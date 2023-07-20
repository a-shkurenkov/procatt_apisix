### Requirements
* [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
* [Ansible kubernates module](https://galaxy.ansible.com/kubernetes/core)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
* [Helm](https://helm.sh/docs/intro/install/)
* [Yandex Cloud CLI](https://cloud.yandex.ru/docs/cli/operations/install-cli)

### Configuration
Create file *terraform/terraform.tfvars*
```
yc_cred = {
  token     = "<YOUR_CLOUD_API_TOKEN>"
  cloud_id  = "<YOUR_CLOUD_ID>"
  folder_id = "<YOUR_FOLDER_ID>"
}
```

### Deploy
```
$ ./up.sh
```

### Testing
Get LoadBalancer IP:
```
$ kubectl -n ingress-apisix get service apisix-gateway
```

Test API:
```
$ curl -H 'Host: test.api.org' http://<LOAD_BALANCER_EXTERNAL_IP>/test
$ curl -H 'Host: test.api.org' http://<LOAD_BALANCER_EXTERNAL_IP>/hola/<some_name>
```

Add LoadBalancer IP to */etc/hosts*
```
$ sudo sh -c 'echo "<LOAD_BALANCER_EXTERNAL_IP> test.prometheus.org" >> /etc/hosts'
```

Open [http://test.prometheus.org](http://test.prometheus.org/) in your browser.

### Remove deployment
```
$ ./down.sh
```
Remove test.prometheus.org record from your */etc/hosts*

