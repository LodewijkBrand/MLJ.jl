if Base.HOME_PROJECT[] !== nothing
    Base.HOME_PROJECT[] = abspath(Base.HOME_PROJECT[])
end
using Pkg
using Documenter
using MLJ
using MLJBase
using MLJModels
using ScientificTypes

# using Literate
# Literate.markdown("common_mlj_workflows.jl", ".",
#                   codefence = "```@example workflows" => "```")

pages = Any["Getting Started"=>"index.md",
            "Common MLJ Workflows" => "common_mlj_workflows.md",
            "Model Search" => "model_search.md",
            "Machines" => "machines.md",
            "Evaluating Model Performance"=>"evaluating_model_performance.md",
            "Performance Measures"=> "performance_measures.md",
            "Tuning Models" => "tuning_models.md",
            "Learning Curves" => "learning_curves.md",
            "Built-in Transformers" => "built_in_transformers.md",
            "Composing Models" => "composing_models.md",
            "Homogeneous Ensembles" => "homogeneous_ensembles.md",
            "Simple User Defined Models" => "simple_user_defined_models.md",
            "Adding Models for General Use" => "adding_models_for_general_use.md",
            "Benchmarking" => "benchmarking.md",
            "Working with Tasks" => "working_with_tasks.md",
            "Internals"=>"internals.md",
            "Glossary"=>"glossary.md",
            "API"=>"api.md",
            "MLJ Cheatsheet" => "mlj_cheatsheet.md",
            "MLJ News"=>"NEWS.md",
            "FAQ" => "frequently_asked_questions.md",
            "Julia BlogPost"=>"julia_blogpost.md",
            "Acceleration and Parallelism"=>"acceleration_and_parallelism.md"]

for p in pages
    println(first(p))
end

makedocs(
    sitename = "MLJ",
    format = Documenter.HTML(),
    modules = [MLJ, MLJBase, MLJModels, ScientificTypes],
    pages=pages)

# By default Documenter does not deploy docs just for PR
# this causes issues with how we're doing things and ends
# up choking the deployment of the docs, so  here we
# force the environment to ignore this so that Documenter
# does indeed deploy the docs
ENV["TRAVIS_PULL_REQUEST"] = "false"

deploydocs(
    repo = "github.com/alan-turing-institute/MLJ.jl.git"
)
