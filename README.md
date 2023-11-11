# cmdloader


A (almost) undetectable loader for any file

## Plugins

Add plugins for extended functions

See the specific plugin install guides for help
### How to load plugins
Just start load.cmd with the argument --plugins-beginn -enable:[plugin-name] --plugins-end

You can include multiple plugins



# Example Usage
Everything (Path):
'"load.cmd path --silent --plugins-beginn -enable:elevator -enable:startup -enable:shutdown --plugins-end"'

Everthing (online):
'"load.cmd url --silent --plugins-beginn -enable:elevator -enable:startup -enable:shutdown --plugins-end"'

No Plugins:
'"load.cmd path --silent"'

⚠️ Not silent (not recommended):
'"load.cmd path"'
