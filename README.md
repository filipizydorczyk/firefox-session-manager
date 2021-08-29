# 🔧 Figer

**Figer** is my linux cli firefox session manager written in bash. I came up with an idea at the moment where I was working with several diffrent clients that gave me some credentials to their accounts. At the beggining it was not a problem but with time services that I was gaining access to started to overlaping and each time I switched to do job for a diffrent client I needed relog on several accounts. So goal of this script/program is to provide me a tool that I can type single command in terminal like `figer switch client1` and I will have all accounts that I need logged in.

![](./assets/example.gif)

When u create new session it's basically fresh firefox. U have:

-   no extensions installed
-   no cookies
-   no history
-   no bookmarks

Once u will switch back to previous session u get back all these things back

# ⌨️ Usage

-   `figer list` - lists session that u can switch to (current session will be not listed)
-   `figer add session1` - creates empty session that has name `session1`. `default` is not valid session name.
-   `figer switch session1` - switch current session to `session1`. If firefox is running it will kill it first, and afterwards run new firefox with new session.
-   `figer rm session1` - removes session named `session1`. It wont be removed if it's current session in firefox or `default`.

# 📲 Installation

Name of software depends on u how u will install it. If u want to use name `figer` just install it with command like

```sh
cp manager.sh ~/.local/bin/figer
```

No matter how u name it `figer` stores sessions in `~/.figer-sessions` (except current one).

# 📝 To do

-   [x] check if there is a way to restart firefox after changing session
-   [x] check if I can run firefox just with difrrent dir without actually moving `~/.mozilla` - not in the way I wanted
-   [x] exclude nam `default` from valid session names (it is reserved for default firefox session that is initialized in first figer run)
-   [x] add check in `switch` command if given session exists before moving sessions
-   [x] check if u can use same files on windows - kind of (note direcotry contains the answer)
-   [ ] add autocopletion
