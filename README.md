## Overview

This Dockerized cybersecurity simulation environment enables hands-on red and blue team training by automating AI-driven attacks on vulnerable targets. It integrates a SIEM with Sigma rules and machine learning for real-time threat detection and alerting.

## Features

- Automated AI-powered attack simulations (SQL Injection, XSS, brute force, etc.)  
- Vulnerable web application target for exploitation practice  
- Integrated SIEM stack (Elastic Stack + Hayabusa) for log collection and analysis  
- Detection based on Sigma rules and machine learning  
- Automated daily environment rollback for consistent testing  
- Real-time alerting and monitoring capabilities

## Getting Started

1. Clone the repository  
2. Install Docker and Docker Compose  
3. Run `docker-compose up -d` to start all services  
4. Access the vulnerable app at `http://localhost:8080`  
5. Review logs and alerts via Kibana at `http://localhost:5601`

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0). See the LICENSE file for details.
