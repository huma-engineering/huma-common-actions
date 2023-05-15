     _       ____   _____   ___    ___    _   _           ____     ___     ____   ____  
    / \     / ___| |_   _| |_ _|  / _ \  | \ | |         |  _ \   / _ \   / ___| / ___| 
   / _ \   | |       | |    | |  | | | | |  \| |  _____  | | | | | | | | | |     \___ \ 
  / ___ \  | |___    | |    | |  | |_| | | |\  | |_____| | |_| | | |_| | | |___   ___) |
 /_/   \_\  \____|   |_|   |___|  \___/  |_| \_|         |____/   \___/   \____| |____/ 
                                                                                        
### Description

GH action to make a diff with input arguments and commenting on pull request if possible

### Inputs

| parameter | description | required | default |
| --- | --- | --- | --- |
| kubeconfig | kubeconfig file path | `true` |  |
| helmfile-folder | The folder of the helmfile | `true` |  |
| helmfile-environment | The environment of the helmfile | `true` | default |


### Outputs

| parameter | description |
| --- | --- |
| diff-output | helmfile diff output |
| comment-id | PR comment id |


### Runs

This action is a `composite` action.


