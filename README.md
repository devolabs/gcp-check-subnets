## Requirements

- Bash >= 3.2
- Google Cloud Console - Organization Compute Admin|Editor|Viewer 

## Usage

```
./gpc-check-subnets.sh <range> <first|all> [filter]
```
  
## Example
  
- Find first result in projects that contains "xyz" in projectId or project name:
```
./gpc-check-subnets.sh 192.168.0.1/24 first xyz
```
  
- Find all results in projects that contains "xyz" in projectId or project name:
```
./gpc-check-subnets.sh 192.168.0.1/24 all xyz
```
  
- Find first result in all projects:
```
./gpc-check-subnets.sh 192.168.0.1/24 first
```
- Find results in all projects:
```
./gpc-check-subnets.sh 192.168.0.1/24 all
```
