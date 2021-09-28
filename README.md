# Host a Dev Environment on Render

This is a template for creating a dev environment that can be hosted on Render
and connected to via SSH. It includes a [Dockerfile](Dockerfile) which installs
a bunch of packages that are useful in dev, and starts a
[dropbear](https://matt.ucc.asn.au/dropbear/dropbear.html) SSH server as a
non-root user. To SSH in from outside your Render network, deploy a [Tailscale
subnet router](https://github.com/render-examples/tailscale) with the same
Render user or team.

Rather than deploying directly, you should create your own repo using this
repo as a template and then deploy by clicking the button below.

[![Deploy to Render](http://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

Read [my post on Render's blog](https://render.com/blog/host-a-dev-environment-on-render-with-vs-code-and-tailscale) for more.
