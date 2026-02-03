# Azure Auto Discover VMSS (Consul)

Implementing a scalable Service Mesh using Envoy Proxy and Consul to automatically discover and load balance Azure Virtual Machine Scale Sets (VMSS).

---

## Features

-   **Consul Service Discovery**  
    Utilizes HashiCorp Consul for decentralized service registration and health checking, ensuring that only healthy instances are available for traffic routing.

-   **Dynamic Envoy Configuration (Consul Template)**  
    Leverages `consul-template` to watch for service changes in the Consul catalog and automatically reloads Envoy's configuration in real-time without downtime.

-   **Automated Infrastructure Scaling**  
    Integrated with Azure Monitor Autoscale to automatically scale backend VM instances in or out based on CPU utilization, while seamlessly registering new nodes to the mesh.

## Infrastructure

### Compute Layer
| Component | Type | Description |
| :--- | :--- | :--- |
| **Control Plane** | Linux VM | Runs **Consul Server** acting as the central registry for service state and health status. |
| **Envoy Gateway** | Linux VM | Runs **Envoy Proxy** paired with **Consul Template**. It polls the Consul Server to update routing rules dynamically. |
| **Backend Pool** | VM Scale Set | A dynamic pool of VMs running Nginx and a **Consul Agent** sidecar that self-registers the service upon startup. |

### Network & Security
* **Service Communication**: All service discovery traffic occurs over the internal VNet `10.0.0.0/16`.
* **Security Groups**: 
    * `Port 8500`: Consul UI & API (Internal/Admin access).
    * `Port 8080`: Envoy Load Balancer ingress.
    * `Port 8300-8302`: Internal Consul gossip protocol.

## How It Works

1.  **Scale Out Event**: Azure Autoscale triggers a new VM instance creation in the Scale Set due to high load (CPU > 70%).
2.  **Self-Registration**: The *Consul Agent* on the new VM starts and registers the "backend-service" with the *Consul Server*.
3.  **Discovery**: *Consul Template* on the Envoy node detects the new service entry in the Consul catalog.
4.  **Reconfiguration**: *Consul Template* renders a new `envoy.yaml` with the new IP address and hot-reloads the Envoy process.
5.  **Traffic Routing**: Traffic is immediately load-balanced to the new instance.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
