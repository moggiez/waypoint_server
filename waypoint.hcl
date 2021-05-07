project = "waypoint_server"


labels = { "project" = "waypoint_server" }

# An application to deploy.
app "waypoint_server" {
    build {
        use "pack" {}
        
        registry {
            use "aws-ecr" {
                region     = "eu-west-1"
                repository = "waypoint-server-repo"
                tag        = gitrefpretty()
            }
        }
    }

    deploy {
        use "aws-ecs" {
            cluster = "waypoint-server-cluster"
            region  = "eu-west-1"
            memory  = "512"
            alb {
                certificate = "arn:aws:acm:eu-west-1:989665778089:certificate/6d064504-7b45-414e-8bb2-78ef4d5b2009"
                domain_name = "moggies.io"
                zone_id = "Z1031385SQRT6FLV9XUJ"
            }
        }
    }
}
