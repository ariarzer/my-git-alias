# My aliases for git

### Install:

1. Clone this repository to the `~/`
    
    ```bash
    cd ~ && git clone https://github.com/ariarzer/my-git-alias.git .gitalias
    ```

2. Add this fragment to the `.gitconfig` file

    ```diff
    + [includeIf "gitdir:~/"]
    +   	path = ~/.gitalias/root  
    ```

### Aliases:

1. **add-global-alias**

    Creates global alias...
    
    ```diff
      ~
      └─ gitalias
    +     └─ <name>
    +        ├─ <name>
    +        └─ <name>.sh
    ```
    ...and includes them to `root` file.
   
    ```diff
    +[includeIf "gitdir:~/"]
    +   path = ~/.gitalias/<name>/<name>
    ```
    
    _Arguments:_ 
    
    - `name` - name of the global alias
