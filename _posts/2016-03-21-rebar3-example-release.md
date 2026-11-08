---
layout: post
title: "Rebar3 Example Release"
date: 2016-03-21
author: Markus Feyh
categories: [Erlang, rebar3]
tags: [erlang, rebar3, build-tools, dependency-management, releases]
---

Using rebar3 is now the industry standard for building and dependency management when programming Erlang. This comes as a result of rebar3 becoming an official part of the Erlang Github repo and being packaged with Erlang distributions.

I have an example project here where I have been playing around with rebar3:   
[https://github.com/markusfeyh/rebar3_example](https://github.com/markusfeyh/rebar3_example)

My goals in using rebar3 are:   
1. managing dependencies of the project   
2. configuring releases based on the environment (using the `sys.config`)

## Managing dependencies

Rebar3 offers the opportunity for making dependency management easier. Rebar3 makes dependency management easier by allowing to use Hex packages. By running the command `rebar3 pkgs` you can retrieve a list of packages that can be included. By example, you can easily include lager as a dependency by including this in your `rebar.config` file:

```erlang
{deps, [lager]}.
```

## Overrides

There are some exceptions to be aware of when developing with common packages currently, because of how new rebar3 is. Overrides enable custom build behaviours that are currently not compatible with rebar3 to be included in `rebar.config` file. 

Packages like riakc and jiffy will require overrides when you use their master branch. For `jiffy` you can get around this by using the feature branch `feature-add-rebar3-support`, but you will want to quickly return to master.

The override (for your `rebar.config`) for `jiffy` looks like this: 

```erlang
{overrides,
 [{override, jiffy, [
     {plugins, [pc]},
     {artifacts, ["priv/jiffy.so"]},
     {provider_hooks, [
         {post,
             [
             {compile, {pc, compile}},
             {clean, {pc, clean}}
             ]
          }]
      }
  ]}
]}.
```

And the override (for your `rebar.config`) for `riakc` looks like this: 

```erlang
{overrides,
 [
  {override, rebar3_protobuffs_plugin, [{deps, [ {protobuffs, {git, "git://github.com/basho/erlang_protobuffs.git", {tag, "0.8.2"}}}]}]},

  {override, protobuffs, [{deps, []}]},

  {override, riak_pb, [{plugins, [{riak_pb_msgcodegen,
                                   {git, "git://github.com/tsloughter/riak_pb_msgcodegen",
                                    {branch, "master"}}},
                                  {rebar3_protobuffs_plugin,
                                   {git, "git://github.com/cmkarlsson/rebar3_protobuffs_plugin",
                                    {tag, "0.1.1"}}}]},
                       {provider_hooks, [{pre, [{compile, {protobuffs, compile}},
                                                {compile, riak_pb_msgcodegen}]}]}]}]
}.
```

## Configuring Releases with Profiles

Rebar3 provides a built in mechanism for managing releases using profiles. You can then easily load the dependencies and configuration files based on your environment. Often I see the environments prod, stage, dev and local. You can select the profile by simply calling it out from the command line. For example, `rebar3 as dev release` will prepare a release using your dev profile.

What does this look like and how does it work? Simply you are going to want to use `overlay_vars` and overlay, which are features of relx. However, rebar3 makes give you the sweet syntactical sugar of profiles.

Here is what it looks like in the `rebar.config` file:

```erlang
{relx, [{release, { blog_post, "0.1.0" },
         [blog_post,
          sasl]},

        {overlay_vars, "config/default.config"},
        {overlay, [
                   {template, "etc/sys.config", "{{output_dir}}/releases/{{release_version}}/sys.config"}]},
        {dev_mode, true},
        {include_erts, false},  
        {extended_start_script, true}
]}.

{profiles, [
           {prod, [{relx, [{overlay_vars, "config/prod.config"}, {dev_mode, false},
                            {include_erts, true}]}]
            },
           {stage, [{relx, [{overlay_vars, "config/stage.config"}, {dev_mode, false},
                            {include_erts, true}]}]
            },
           {dev, [{relx, [{overlay_vars, "config/dev.config"}, {dev_mode, false},
                            {include_erts, true}]}]
            }]
}.
```

## Summary

Rebar3 has become the standard tool for Erlang development, offering:

- **Simplified dependency management** through Hex packages
- **Profile-based releases** for different environments
- **Override system** for packages that need custom build behaviors
- **Integration with relx** for release management

The tool has evolved significantly since its early versions and now provides a robust foundation for building and deploying Erlang applications across different environments. 