Alpha Config
====

Some useful commands 
---

    ssh-keygen -t ed25519 -C "argocd@mattiaborrini.com" -f ~/.ssh/argocd_ed25519  -q -N ""

The -N "" command is used to generate an sshkey without passphrase

About kustomize
---

You can even use kustomize to modify some changes in helm chart, this could be really useful

Examples
---

- Example-1: You will use image updater without creating a commit in the gitops.repo. This way it will
automatically updated at every patch version so from passing by version v0.1.0 to v0.1.*

- Example-2: You will use image updater to create a commit in the gitops.repo. This way argo cd will automatically update
it because a new commit is read in the gitops.repo. This is really in gitops spirit to save from disaster recovering

- Example-3: Now let's use an image which is protected