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

## Output
The script returns information about the projects where the searched subnet exists.

##### Match:
```
######################################
Subnet xxx.xxx.xxx.xxx/xx does exist!
######################################
Project ID:  xxx-xxx-xxx
Range: xxx.xxx.xxx.xxx/xx
######################################
```
##### Unmatched:
```
######################################
Subnet xxx.xxx.xxx.xxx/xx does NOT exist!
######################################

```
##### Also the script create 3 files in the execution path:
- result.log (contain the projects where the searched subnet exists)
- ranges.log (contain all the ranges/subnets evaluated)
- projects.log (contain all the projects where the subnet was serched)

