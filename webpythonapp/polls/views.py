from django.http import HttpResponse, Http404
from django.shortcuts import get_object_or_404, render
from django.template import loader

from .models import Question

# Create your views here.
def index(request):
    latest_questions_list = Question.objects.order_by('-pub_date')[:5]
    context = {
        'latest_questions_list' : latest_questions_list,
    }
    return render(request, 'polls/home.html', context)


def detail(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    return render(request, 'polls/details.html', { 'question' : question })


def results(request, question_id):
    return HttpResponse("You're looking on the \
        result of the question %s" % question_id)

def vote(request, question_id):
    return HttpResponse("You're looking on the \
        votes of the question %s" % question_id)

