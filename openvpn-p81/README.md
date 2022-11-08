     _       ____   _____   ___    ___    _   _           ____     ___     ____   ____  
    / \     / ___| |_   _| |_ _|  / _ \  | \ | |         |  _ \   / _ \   / ___| / ___| 
   / _ \   | |       | |    | |  | | | | |  \| |  _____  | | | | | | | | | |     \___ \ 
  / ___ \  | |___    | |    | |  | |_| | | |\  | |_____| | |_| | | |_| | | |___   ___) |
 /_/   \_\  \____|   |_|   |___|  \___/  |_| \_|         |____/   \___/   \____| |____/ 
                                                                                        
### Description

OpenVPN connected to Perimeter81 through configfile URL

### Inputs

| parameter | description | required | default |
| --- | --- | --- | --- |
| configfile-url | OpenVPN config file url | `true` |  |
| username | OpenVPN username | `true` |  |
| password | OpenVPN password | `true` |  |


### Outputs

| parameter | description |
| --- | --- |
| ip | The OpenVPN IP |


### Runs

This action is a `composite` action.


