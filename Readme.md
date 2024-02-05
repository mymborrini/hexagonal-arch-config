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
it because a new commit is read in the gitops.repo. This is really in gitops spirit to save from disaster recovering. We set the 
strategy to digest, this way every time you push to the same 'latest' tag 

- Example-3: Now let's use applicationSet to define a template for each environment

- Example-4: Now let's use helm chart

Forget argocd (I cannot build both of them with minikube) and focus about istio
- Example-5: Traffic management canary sidecar containers
- Example-6: Exposing to the outside using Ingress Gateway

Sealed Secret
-

Sealed secret is a way to encript your secret, this way we can update our repo-secret on github since it's
encrypted
Once installed with terraform. And installed the client in your wm To encrypt a secret to it this way

$ kubeseal -f .\repo-secret.yaml -w sealed-repo-secret.yaml --controller-name sealed-secrets

Remember the secret is specific for the cluster you cannot copy and paste the secret to each cluster you have


Istio
-

There are different ways to insert side car container the first one is to specify it in the namespace so

    apiVersion: v1
    kind: Namespace
    metadata:
        name: 
        labels:
            istio-injection: enabled

Another method is the pod inject method

    template:
        metadata:
            app:
            version:
            istio: monitor
            sidecar.istio.io/inject: "true"

You can inject it command line by using the istioctl command

 istioctl kube-inject -f <file.yaml> | kubectl apply -f <file.yaml>
 
Istio Ingress Gateway
