namespace :docker do
  desc "Push the latest docker image to DockerHub"
  task push_image: :environment do
    TAG = `git rev-parse --short HEAD`
    sh "docker build -t tzumby/rails-kube-demo:#{TAG}"
    sh "docker push tzumby/rails-kube-demo:#{TAG}"
  end

end
