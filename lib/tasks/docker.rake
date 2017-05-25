namespace :docker do
  desc "Push docker images to DockerHub"
  task :push, [:image] => :environment do |t, args|
    TAG = `git rev-parse --short HEAD`.strip

    puts "Building #{args[:image]} Docker image"
    sh "docker build -t tzumby/rails-#{args[:image]}:#{TAG} -f #{args[:image]}.Dockerfile ."

    IMAGE_ID = `docker images | grep tzumby\/rails-#{args[:image]} | head -n1 | awk '{print $3}'`.strip

    puts "Tagging latest image"
    sh "docker tag #{IMAGE_ID} tzumby/rails-#{args[:image]}:latest"

    puts "Pushing Docker image"
    sh "docker push tzumby/rails-#{args[:image]}:#{TAG}"
    sh "docker push tzumby/rails-#{args[:image]}:latest"

    puts "Done"
  end

end
