# Plug & play system security audit tool (KVH-018)

## Given problem statement 
Plug and Play System Security Audit Tool for Windows, and Linux with a centralized dashboard.

## About

Plug and Play System Security Audit Tool Agent-based with a centralized dashboard which displays the organizations vulnerability/attack surface along with detailed reports of individual systems.
</br></br>
We essentially flash a USB stick with different system auditing tools which is able to scan for system and network vulnerabilities, which then is either plugged in or deployed on all systems to run an audit, whose report is uploaded to a cloud DB (mongodb)
</br></br>
The dashboard displays the aggregate results and uses different visualization tools (like pie charts etc) to provide insights into the vulnerabilities and attack surface.
</br></br>
We are  installing the required tools on the host system and then uninstall them after the audit is completed. So elevated privileges are required to run the audit.
</br></br>
The different things it scans for are
- Network Topology & port analysis (using nmap)
- File integrity of specific system & organization files by comparing with provided hashes.
- Web App scanning for enterprises management software using ZAP
- System and LAN vulnerability scanning using Metasploit.

🔗 Find the links below for 
- [prototype](https://github.com/Tense-Turtles/plug-and-play-security-audit/) 
- [ppt](https://docs.google.com/presentation/d/1M9kIHzl2oGw3RfJL4fgLBImlGZEQJziT/edit#slide=id.p5)
<!-- - [centralized dashboard](https://github.com/Tense-Turtles/plug-and-play-security-audit/) --> 
<!-- - [demo video](https://github.com/Tense-Turtles/plug-and-play-security-audit/) -->

## Tech Stack Used
- **Shell Script** - Powershell (windows) or BASH (linux)
- **Next.js** - opensource web framework built on top of React, which allows developers to create web applications with server-side rendering, automatic code splitting, and simplified client-side routing.
- **MongoDB** - non-relational document database that provides support for JSON-like storage
- **Nmap** - Network Mapper for host machine to identify port, OS detection,perform a TCP SYN scan,etc
- **ZAP** - System audit tool for web applications security vulnerabilities.
- **Metasploit** - for vulnerability scanning and complaince testing 
- **Clam AV** - open source cross platform antivirus toolkit designed to detect the malware, viruses, worms,etc.
- **Lynis** - battle-tested security tool for  auditing, system hardening, compliance testing of systems running Linux, macOS, or Unix-based operating system.
- **OSSEC** - powerful correlation and analysis engine, integrating log analysis, file integrity monitoring, Windows registry monitoring, centralized policy enforcement, rootkit detection, real-time alerting and active response. 
- **MetaCpan’s Html Doc Convert**  - convert the generated reports to html boilerplate. 

## Preview
<table>
  <tr>
    <td>
    <img src="https://user-images.githubusercontent.com/78999739/233152237-f5c16e58-8b91-4d32-b3fe-185130006b03.png">
    </td>
  <td>
    <img src="https://user-images.githubusercontent.com/78999739/233151585-7c69edcf-d17c-4a5b-9423-ca694b525a43.png">
  </td>
  </tr>
  <tr>
    <td><img src="https://github.com/Tense-Turtles/plug-and-play-security-audit/raw/main/dashboard.png"  ></td>
    <td><img src="https://github.com/Tense-Turtles/plug-and-play-security-audit/raw/main/report.png" ></td>
  </tr>
 </table>


<!--- ## ZAP --->
<!--- https://github.com/zaproxy/zaproxy/releases/download/v2.12.0/ZAP_2.12.0_Crossplatform.zip --->
<!--- download this and extract it into /ZAP at project root*/ --->
