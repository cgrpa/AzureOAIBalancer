# AzureOAIBalancer
AzureOAIBalancer is a Terraform repository for automating the deployment of a load-balanced Azure OpenAI environment across multiple regions. It aims to increase throughput and manage high request volumes for any OpenAI model by distributing workloads evenly.

![VP8_JyCm4CNt-nH71mH36oNPAe5QCLIH2bH1R2okVRIMN3lu3nKWlZkE4qiCKJtPztltV4-wbVFC-d1I05U2tgKcVDcrpTFcjTtYqVlEBOl2ilFY8Fqnx8CZoutsfFs2crCaUrAa1IkuZFLvfvZktOhFSb4MhhFIamDWt1kB3qh6FW1Bt3DzK8IpzNUmXEjTypX3vj85Vm3Z4SopF](https://github.com/cgrpa/AzureOAIBalancer/assets/95618126/08717c1a-d240-42bd-a5ae-3b0f2e8bf67a)

Utilizing a random integer-based load balancer, it's advisable to implement a backoff strategy on the client side to handle RateLimitError. In the event of encountering a rate limit error, retrying the request should lead to a random redirection to a different deployment, potentially bypassing the rate limit obstacle.
