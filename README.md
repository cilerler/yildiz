[![](https://images.microbadger.com/badges/image/cilerler/google-cloud-sdk.svg)](http://microbadger.com/images/cilerler/google-cloud-sdk "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/cilerler/google-cloud-sdk.svg)](http://microbadger.com/images/cilerler/google-cloud-sdk "Get your own version badge on microbadger.com")

# Google Cloud SDK Docker w/ PowerShell

This is Docker image for the [Google Cloud SDK](https://cloud.google.com/sdk/) with Powershell

This image is Debian-based and includes default command
line tools of Google Cloud SDK (`gcloud`, `gsutil`, `bq`) as well as all
[additional components](https://cloud.google.com/sdk/downloads#apt-get) and Microsoft PowerShell Core.

## Usage

To use this image, pull from [Docker Hub](https://hub.docker.com/r/google/cloud-sdk/), run the following command:

```
docker pull cilerler/google-cloud-sdk:latest
```

Verify the install

```powershell
docker run -ti  google/cloud-sdk:latest gcloud version
```

Then, authenticate by running:

```powershell
docker run -ti --name gcloud-config google/cloud-sdk gcloud auth login
```

Once you authenticate successfully, credentials are preserved in the volume of
the `gcloud-config` container.

To list compute instances using these credentials, run the container with
`--volumes-from`:

```
docker run --rm -ti --volumes-from gcloud-config google/cloud-sdk gcloud compute instances list --project your_project
NAME        ZONE           MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP      STATUS
instance-1  us-central1-a  n1-standard-1               10.240.0.2   8.34.219.29      RUNNING
```

> :warning: **Warning:** The `gcloud-config` container now has a volume
> containing your Google Cloud credentials. Do not use `gcloud-config` volume in
> other containers.


Alternatively, you can use use `auth/credential_file_override` property to set a path to a mounted service account
and then the config to read that using `CLOUDSDK_CONFIG` environment variable.

for example, `mycloud` configuration below has the `auth/credential_file_override` already set and points towards a certificate file
that will be present within the container as a separate volume mount.

> See [issue#152](https://github.com/GoogleCloudPlatform/cloud-sdk-docker/issues/152#event-1933393673)

```
$ docker run -ti -e CLOUDSDK_CONFIG=/config/mygcloud \
                 -v `pwd`/mygcloud:/config/mygcloud \
                 -v `pwd`:/certs  google/cloud-sdk:alpine /bin/bash

bash-4.4# gcloud config list
[auth]
credential_file_override = /certs/svc_account.json

bash-4.4# head -10  /certs/svc_account.json
{
  "type": "service_account",
  "project_id": "project_id1",
....

bash-4.4# gcloud projects list
PROJECT_ID           NAME         PROJECT_NUMBER
project_id1          GCPAppID     1071284184432

```


### Installing additional components

By default, [all gcloud components
are](https://cloud.google.com/sdk/downloads#apt-get) installed on the default
image.


### Cloud SDK Release Tracking

You can also follow the Cloud SDK Release schedule here
- [https://groups.google.com/forum/#!forum/google-cloud-sdk-announce](https://groups.google.com/forum/#!forum/google-cloud-sdk-announce)