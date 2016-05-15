# liquid-defaults
A liquid filter plugin to set cascading default values. Originally made for use with Jekyll but should work in shopify sites as well.

## Using:

```liquid
{{ page.title | defaults: page.secondTitle page.thirdTitle "Whatever" }}
```

This will outpu the page.title variable, if its not set will output page.secodTitle, then page.thirdTitle, and finally if none of the previous variables are set it will output 'Whatever'. 

Both nil and en empty string is concidered not set. If theres no default literal in the values then an empty string is returned.