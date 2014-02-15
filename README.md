# Cetrasoft Website 3.0

## Install Instructions

1. Clone the repository

        git clone git@bitbucket.org:cetrasoft/cetrasoft-v3.git
        cd cetrasoft-v3

2. Install Ruby

    Check if you have the proper version of Ruby

        rbenv version

    If the proper version is not present

        rbenv install 1.9.3-p392
        rbenv rehash

3. Install gems

    If Bundler is not already installed

        gem install bundler

    Install the project gems into the local directory

        bundle install --path vendor

## Development Usage

1. Run the preview server

        bundle exec middleman

2. Navigate to the site at: http://localhost:4567/

## General Notes

* **Slim:** all calls to helper functions must be unescaped using the '==' symbol

        == link_to 'Example', 'www.example.com'

## Blogging

For full documentation, click [here](http://middlemanapp.com/blogging/)

1. Create a new blog post

        bundle exec middleman article [TITLE]

    * NOTE: Be careful with punctuation in the post title when generating the blog post

2. (Optional) Add a subdirectory for any assets for a particular post.

    See _Article Subdirectory_ in the [documentation](http://middlemanapp.com/blogging/)

## Deployment

1. Compile the project into a static site

        bundle exec middleman build --clean

2. Sync the newly built project with Amazon S3

        bundle exec middleman sync

    * NOTE: Currently the sync procedure doesn't seem to be correctly marking orphaned files for deletion. If you know that you've removed a file that would have been part of a previous build, please remove it manually from the S3 bucket.

3. **Commit** and **push** your Git repository (or production and dev codebases will be out of sync)
