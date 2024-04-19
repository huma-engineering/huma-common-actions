     _       ____   _____   ___    ___    _   _           ____     ___     ____   ____  
    / \     / ___| |_   _| |_ _|  / _ \  | \ | |         |  _ \   / _ \   / ___| / ___| 
   / _ \   | |       | |    | |  | | | | |  \| |  _____  | | | | | | | | | |     \___ \ 
  / ___ \  | |___    | |    | |  | |_| | | |\  | |_____| | |_| | | |_| | | |___   ___) |
 /_/   \_\  \____|   |_|   |___|  \___/  |_| \_|         |____/   \___/   \____| |____/ 
                                                                                        
### Description

GH action to make a diff with input arguments and showing the result to 
review before applying

### Inputs

| parameter | description | required | default |
| --- | --- | --- | --- |
| kubeconfig | kubeconfig file path | `true` |  |
| helmfile-folder | The folder of the helmfile | `true` |  |
| helmfile-environment | The environment of the helmfile | `true` | default |


### Outputs

| parameter | description |
| --- | --- |


### Runs

This action is a `composite` action.


