# Luau Cron

A task scheduler in Luau based on [node-cron](https://github.com/node-cron/node-cron), which is based on the GNU Crontab.

## Installation
You can install luau-cron using [Wally](https://wally.run/):
```toml
[dependencies]
luau-cron = "ulferno/luau-cron@0.0.1"
```

## Use
Simply require access the module and use the `schedule`, `validate` and `getTasks` methods.
```lua
local Cron = require(path.to.cron)

Cron.schedule("* */5 * * * *", function()
	print("every five minutes!")
end)
```

## Syntax
### Allowed fields


```
  ┌────────────── second (optional)
  │ ┌──────────── minute
  │ │ ┌────────── hour
  │ │ │ ┌──────── day of month
  │ │ │ │ ┌────── month
  │ │ │ │ │ ┌──── day of week
  │ │ │ │ │ │
  │ │ │ │ │ │
  * * * * * *
```

### Allowed values

| field        | value                             |
| ------------ | --------------------------------- |
| second       | 0-59                              |
| minute       | 0-59                              |
| hour         | 0-23                              |
| day of month | 1-31                              |
| month        | 1-12 (or names)                   |
| day of week  | 0-7 (or names, 0 or 7 are sunday) |

#### Using multiples values

You may use multiples values separated by comma:

```lua
local Cron = require(path.to.cron)

Cron.schedule("1,2,4,5 * * * *", function()
	print("running every minute 1, 2, 4 and 5")
end)
```

#### Using ranges

You may also define a range of values:

```lua
local Cron = require(path.to.cron)

Cron.schedule("1-5 * * * *", function()
	print("running every minute to 1 from 5")
end)
```

#### Using step values

Step values can be used in conjunction with ranges, following a range with '/' and a number. e.g: `1-10/2` that is the same as `2,4,6,8,10`. Steps are also permitted after an asterisk, so if you want to say “every two minutes”, just use `*/2`.

```lua
local Cron = require(path.to.cron)

Cron.schedule("*/2 * * * *", function()
	print("running a task every two minutes")
end)
```

#### Using names

For month and week day you also may use names or short names. e.g:

```lua
local Cron = require(path.to.cron)

Cron.schedule("* * * January,September Sunday", function()
	print("running on Sundays of January and September")
end)
```

Or with short names:

```lua
local Cron = require(path.to.cron)

Cron.schedule("* * * Jan,Sep Sun", function()
	print("running on Sundays of January and September")
end)
```
