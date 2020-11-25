## Getting security right at every stage of your containerization journey
Kubernetes today has become the de facto standard for automating the deployment and management of cloud-native applications.
In the last five years, infrastructure software has benefited from tremendous innovations driven by the emergence of cloud-native technologies and architectures. Collectively, these approaches enable organizations to develop and run applications in ways that are more scalable, flexible and dynamic than previously possible using containers, micro-services,declarative APIs and software primitives that abstract away underlying compute, storage, and networking. Coupled with continuous delivery and DevOps practices, companies of every size across Banking and Financial institutions are now empowered to release software with greater speed and reliability.
In parallel, the adoption of cloud-native technologies creates new security challenges that must be addressed as well as opportunities to enhance existing security strategies. Effective security nearly always starts with visibility into a given environment and its overall security state as the most critical use case.

## Why do we care about container Security? 
As Banking and Financial Institutions embrace containerized, cloud-native applications, they recognize that the need for security is as paramount as ever but struggle to secure these new technologies. Since everyone is learning the new stack, less likely to have road map for how to apply security across the various stages of the containerization journey. Each stage introduces novel security challenges, and Banks must learn both the infrastructure and the security at the same time. Understandably, security needs evolve as companies move from developing their first containerized application to doing all new development in containers and managing thousands of micro-services. 

Containers and tools like Kubernetes enable enterprises to automate many aspects of application deployment, providing tremendous business benefits. But these new deployments are just as vulnerable to attacks and exploits from hackers and insiders as traditional environments. Attacks for ransomware, crypto mining, data stealing and service disruption will continue to be launched against new container based virtualized environments in both private and public clouds. To make matters worse, new tools and technologies like Docker and Kubernetes will themselves be under attack in order to find ways into an Bank’s prized assets.

Containers can increase the speed and efficiency of the development process while maintaining consistency across the board, they can also expose Bank to potential risks without sufficient security controls. However, the increasingly widespread adoption of container technologies also means an ever increasing need to secure them from the wide range of potential threats at each stage of the development pipeline.

While security teams have the same mission regardless of the technology stack in use – keep the bad guys out and find and stop them if they do break in – the tools and tactics security staff employ must change to accommodate this infrastructure shift.

Security remains the primary concern around enterprise container strategy. In a recent survey of IT and security practitioners and decision makers, 35% of respondents identified a lack of adequate investment in container security as their biggest concern relating to their organization’s container strategy, with another 15% lamenting that their container strategy doesn’t take security threats seriously.

# Containers and Kubernetes Attacks & Defending Techniques
  Popular kubernetes attack scenarios  - Simulation
  <details>
     <summary>1. Container Breakout Attack</summary>
       <p>There are ways in which risky container configurations can make it easy to escape the container,
          with no vulnerability required. Combine these bad configurations with containers running as root, 
          and you have a recipe for disaster. Running as root inside a container isn’t exactly a problem in and of itself, 
          as the attacker still needs to find a way to escape the container. From time to time container escape vulnerabilities
          have been found, and they probably will continue to be found. But a runtime vulnerability isn’t the only way that container
          escape can be made pos‐sible.</p>
  </details>
   <details>
     <summary>2. Cryptojacking Attack</summary>
     <p>Crypto-mining attacks have become one of the most appealing attacks to hackers as 
        it is an almost guaranteed way of gaining some benefits out of a successful intrusion. 
        Thieves come only to steal or destroy. If disruption is not the goal of the intrusion, 
        a crypto-mining attack is probably one of the main choices for hackers.
        
  At least two ways for hackers to launch a crypto-mining attack on a target victim have 
  been reported. One is through application vulnerabilities, such as cross-site scripting, SQL 
  injection, remote code execution, and more, so that the hacker gains access to the system, 
  then downloads and executes the miner binary. The other way is through a malicious 
  container image. When a container is created from the image that contains the mining 
  binary, the mining process starts. 
  Although there are different types of crypto-mining binaries available on the internet, 
  in general, the mining process is computation heavy and occupies a lot of CPU cycles. 
  The mining process sometimes joins a mining pool in order to carry out mining in a 
  collaborative way.</p>
  </details>
<details>
     <summary>Courtesy Note:</summary>
       <p>https://securek8s.dev</p>
  </details>
